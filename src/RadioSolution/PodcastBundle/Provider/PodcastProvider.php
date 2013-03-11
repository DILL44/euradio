<?php
/*
 * This file is part of the Sonata project.
 *
 * (c) Thomas Rabaix <thomas.rabaix@sonata-project.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */



namespace RadioSolution\PodcastBundle\Provider;

use Symfony\Component\Finder\Finder;

use Sonata\MediaBundle\Entity\MediaManager;

use Sonata\MediaBundle\Provider\FileProvider;

use Application\Sonata\MediaBundle\Entity\Media;

use Sonata\MediaBundle\Model\MediaInterface;
use Sonata\MediaBundle\CDN\CDNInterface;
use Sonata\MediaBundle\Generator\GeneratorInterface;
use Sonata\MediaBundle\Thumbnail\ThumbnailInterface;

use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Validator\ErrorElement;

use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Form\FormBuilder;

use Gaufrette\Filesystem;

use Sonata\MediaBundle\Provider\BaseProvider as BaseProvider;


class PodcastProvider extends BaseProvider
{
	protected $fileName;
	protected $ContentFile;
    protected $allowedExtensions;
    protected $allowedMimeTypes;

    /**
     * @param string                                           $name
     * @param \Gaufrette\Filesystem                            $filesystem
     * @param \Sonata\MediaBundle\CDN\CDNInterface             $cdn
     * @param \Sonata\MediaBundle\Generator\GeneratorInterface $pathGenerator
     * @param \Sonata\MediaBundle\Thumbnail\ThumbnailInterface $thumbnail
     * @param array                                            $allowedExtensions
     * @param array                                            $allowedMimeTypes
     */
    public function __construct($name, Filesystem $filesystem, CDNInterface $cdn, GeneratorInterface $pathGenerator, ThumbnailInterface $thumbnail)
    {
        parent::__construct($name, $filesystem, $cdn, $pathGenerator, $thumbnail);

        $this->allowedExtensions = Array('mp3','ogg');
        $this->allowedMimeTypes  = Array('audio/mpeg','audio/mp3','audio/ogg');
        

    }
    
    /**
     * {@inheritdoc}
     */
    public function getReferenceImage(MediaInterface $media)
    {
    	return sprintf('%s/%s',
    			$this->generatePath($media),
    			$media->getProviderReference()
    	);
    }
    
    /**
     * {@inheritdoc}
     */
    public function getReferenceFile(MediaInterface $media)
    {
        return $this->getFilesystem()->get($this->getReferenceImage($media), true);
    }

    /**
     * {@inheritdoc}
     */
    public function buildEditForm(FormMapper $formMapper)
    {
    	$finder = new Finder();
    	$finder->files()->name('/\.mp3$/')->in('uploads/ftp/');
    	foreach ($finder as $mp3)
    	
    	{
    		$filename='uploads/ftp/'.$mp3->getFilename();
    		$handle = fopen($filename, "rb");
    		$list[$mp3->getFilename()]=$mp3->getFilename();
    		$this->ContentFile[$mp3->getFilename()]=$mp3;
    	}
    	$list[]=' ';
        $formMapper->add('name');
        $formMapper->add('enabled', null, array('required' => false));
        $formMapper->add('authorName');
        $formMapper->add('cdnIsFlushable');
        $formMapper->add('description');
        $formMapper->add('copyright');
    	$formMapper->add('binaryContent', 'choice', array('choices' => $list));
    }

    /**
     * {@inheritdoc}
     */
    public function buildCreateForm(FormMapper $formMapper)
    {
    	$finder = new Finder();
    	$finder->files()->name('/\.mp3$/')->in('uploads/ftp/');
    	foreach ($finder as $mp3)
    	{
    		$filename='uploads/ftp/'.$mp3->getFilename();
    		$handle = fopen($filename, "rb");
    		$list[$mp3->getFilename()]=$mp3->getFilename();
    		$this->ContentFile[$mp3->getFilename()]=$mp3;
    	}
    	$list[]=' ';
    	$formMapper->add('binaryContent', 'choice', array('choices' => $list));
    }

    /**
     * {@inheritdoc}
     */
    public function buildMediaType(FormBuilder $formBuilder)
    {
    	$finder = new Finder();
    	$finder->files()->name('/\.mp3$/')->in('uploads/ftp/');
    	foreach ($finder as $mp3)
    	{
    		$filename='uploads/ftp/'.$mp3->getFilename();
    		$handle = fopen($filename, "rb");
    		$list[$mp3->getFilename()]=$mp3->getFilename();
    		$this->ContentFile[$mp3->getFilename()]=$mp3;
    	}
    	$list[]=' ';
    	$formMapper->add('binaryContent', 'choice', array('choices' => $list));
    }

    /**
     * {@inheritdoc}
     */
    public function postPersist(MediaInterface $media)
    {
        if ($media->getBinaryContent() === null) {
            return;
        }
        $this->setFileContents($media);
        $this->generateThumbnails($media);
        $this->mp32OggFile($media);
        if(strstr($this->fileName,'uploads/ftp')){
        	unlink($this->fileName);
        }else{
        	unlink($this->fileName);
        }
    }

    /**
     * {@inheritdoc}
     */
    public function postUpdate(MediaInterface $media)
    {
        if (!$media->getBinaryContent() instanceof \SplFileInfo) {
            return;
        }

        // Delete the current file from the FS
        $oldMedia = clone $media;
        $oldMedia->setProviderReference($media->getPreviousProviderReference());

        $path = $this->getReferenceImage($oldMedia);

        if ($this->getFilesystem()->has($path)) {
            $this->getFilesystem()->delete($path);
        }

        $this->fixBinaryContent($media);

        $this->setFileContents($media);

        $this->generateThumbnails($media);
        
    }

    /**
     * @throws \RuntimeException
     *
     * @param \Sonata\MediaBundle\Model\MediaInterface $media
     *
     * @return
     */
    protected function fixBinaryContent(MediaInterface $media)
    {
        if ($media->getBinaryContent() === null) {
        	
            return;
        }

        // if the binary content is a filename => convert to a valid File
        if (!$media->getBinaryContent() instanceof File) {
        	
			$this->fileName=$media->getBinaryContent();
			if (isset($this->ContentFile[$media->getBinaryContent()]))
        	$media->setBinaryContent($this->ContentFile[$media->getBinaryContent()]);
            if (!is_file($media->getBinaryContent())) {
                throw new \RuntimeException('The file does not exist : ' . $media->getBinaryContent());
            }

            $binaryContent = new File($media->getBinaryContent());
            $media->setBinaryContent($binaryContent); 
        }
    }

    /**
     * @throws \RuntimeException
     *
     * @param \Sonata\MediaBundle\Model\MediaInterface $media
     *
     * @return void
     */
    protected function fixFilename(MediaInterface $media)
    {
        if ($media->getBinaryContent() instanceof UploadedFile) {
            $media->setName($media->getBinaryContent()->getClientOriginalName());
            $media->setMetadataValue('filename', $media->getBinaryContent()->getClientOriginalName());
        } else if ($media->getBinaryContent() instanceof File) {
            $media->setName($media->getBinaryContent()->getBasename());
            $media->setMetadataValue('filename', $media->getBinaryContent()->getBasename());
        }

        // this is the original name
        if (!$media->getName()) {
            throw new \RuntimeException('Please define a valid media\'s name');
        }
    }

    /**
     * {@inheritdoc}
     */
    protected function doTransform(MediaInterface $media)
    {
        $this->fixBinaryContent($media);
        $this->fixFilename($media);

        // this is the name used to store the file
        if (!$media->getProviderReference()) {
            $media->setProviderReference($this->generateReferenceName($media));
        }

        if ($media->getBinaryContent()) {
            $media->setContentType($media->getBinaryContent()->getMimeType());
            $media->setSize($media->getBinaryContent()->getSize());
        }

        $media->setProviderStatus(MediaInterface::STATUS_OK);
    }

    /**
     * {@inheritdoc}
     */
    public function updateMetadata(MediaInterface $media, $force = true)
    {
        // this is now optimized at all!!!
        $path = tempnam(sys_get_temp_dir(), 'sonata_update_metadata');
        $fileObject = new \SplFileObject($path, 'w');
        $fileObject->fwrite($this->getReferenceFile($media)->getContent());

        $media->setSize($fileObject->getSize());
    }

    /**
     * {@inheritdoc}
     */
    public function generatePublicUrl(MediaInterface $media, $format)
    {
        if ($format == 'reference') {
            $path = $this->getReferenceImage($media);
        } else {
            $path = sprintf('media_bundle/images/files/%s/file.png', $format);
        }
        return $this->getCdn()->getPath($path, $media->getCdnIsFlushable()); 
    }

    /**
     * {@inheritdoc}
     */
    public function getHelperProperties(MediaInterface $media, $format, $options = array())
    {
        return array_merge(array(
            'title'       => $media->getName(),
        ), $options);
    }

    /**
     * {@inheritdoc}
     */
    public function generatePrivateUrl(MediaInterface $media, $format)
    {
        return false;
    }

    /**
     * {@inheritdoc}
     */
    public function preRemove(MediaInterface $media)
    {
        // never delete icon image
    }

    /**
     * Set the file contents for an image
     *
     * @param \Sonata\MediaBundle\Model\MediaInterface $media
     * @param string                                  $contents path to contents, defaults to MediaInterface BinaryContent
     *
     * @return void
     */
    protected function setFileContents(MediaInterface $media, $contents = null)
    {
        $file = $this->getFilesystem()->get(sprintf('%s/%s', $this->generatePath($media), $media->getProviderReference()), true);

        if (!$contents) {
            $contents = $media->getBinaryContent()->getRealPath();
        }

        $file->setContent(file_get_contents($contents));
    }

    /**
     * {@inheritdoc}
     */
    public function postRemove(MediaInterface $media)
    {
        // never delete icon image
    }

    /**
     * @param \Sonata\MediaBundle\Model\MediaInterface $media
     *
     * @return string
     */
    protected function generateReferenceName(MediaInterface $media)
    {
        return sha1($media->getName() . rand(11111, 99999)) . '.' . $media->getBinaryContent()->guessExtension();
    }

    /**
     * {@inheritdoc}
     */
    public function getDownloadResponse(MediaInterface $media, $format, $mode = null)
    {
        // build the default headers
        $headers = array(
            'Content-Type'          => $media->getContentType(),
            'Content-Disposition'   => sprintf('attachment; filename="%s"', $media->getMetadataValue('filename')),
        );

        // create default variables
        if ($mode == 'X-Sendfile') {
            $headers['X-Sendfile'] = $this->generatePrivateUrl($media, $format);
            $content = '';
        } else if ($mode == 'X-Accel-Redirect') {
            $headers['X-Accel-Redirect'] = $this->generatePrivateUrl($media, $format);
            $content = '';
        } else if ($mode == 'http') {
            $content = $this->getReferenceFile($media)->getContent();
        } else {
            $content = '';
        }

        return new Response($content, 200, $headers);
    }

    /**
     * {@inheritdoc}
     */
    public function validate(ErrorElement $errorElement, MediaInterface $media)
    {
        if (!$media->getBinaryContent() instanceof \SplFileInfo) {
            return;
        }

        if ($media->getBinaryContent() instanceof UploadedFile) {
            $fileName = $media->getBinaryContent()->getClientOriginalName();
        } else if ($media->getBinaryContent() instanceof File) {
            $fileName = $media->getBinaryContent()->getFilename();
        } else {
            throw new \RuntimeException(sprintf('Invalid binary content type: %s', get_class($media->getBinaryContent())));
        }

        if (!in_array(strtolower(pathinfo($fileName, PATHINFO_EXTENSION)), $this->allowedExtensions)) {
            $errorElement
                ->with('binaryContent')
                    ->addViolation('Invalid extensions')
                ->end();
        }

        if (!in_array($media->getBinaryContent()->getMimeType(), $this->allowedMimeTypes)) {
            $errorElement
                ->with('binaryContent')
                    ->addViolation('Invalid mime type : ' . $media->getBinaryContent()->getMimeType())
                ->end();
        }
    }
    
    protected function mp32OggFile($file, $delete = FALSE)
    {
    	$path=$this->pathGenerator->generatePath($file);
    	$fileName=$file->getProviderReference();
    	if(file_exists("/var/www/euradionantes.dev/httpdocs/web/uploads/media/$path/$fileName"))
    	{
    		$res = @system("ffmpeg -i /var/www/euradionantes.dev/httpdocs/web/uploads/media/$path/$fileName -vcodec libtheora -acodec libvorbis /var/www/euradionantes.dev/httpdocs/web/uploads/media/$path/$fileName.ogg");
    		if($delete == TRUE)
    		{
    			//unlink($file);
    		}
    			return true;
    		}
    	else {
    		echo "Unable to convert Podcast file in uploads/media/$path/$fileName.\n";
    		return false;
    	}
    }
}

