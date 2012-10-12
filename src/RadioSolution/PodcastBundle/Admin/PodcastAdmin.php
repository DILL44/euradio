<?php 
namespace RadioSolution\PodcastBundle\Admin;
 
use Application\Sonata\MediaBundle\Entity\Media;
use Sonata\UserBundle\Controller\AdminSecurityController;
use Imagine\Exception\Exception;
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
 
class PodcastAdmin extends Admin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
      ->add('name')
      ->add('real_time_start')
      ->with('posts')
      ->add('posts', 'sonata_type_model', array(), array('edit' => 'inline','inline' => 'table'))
      ->end()
      ->with('file')
      ->add('filePodcast', 'sonata_type_model', array(), array('edit' => 'list'))
      ->end()
    ;
  }
 
  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
      ->add('name')
      ->add('posts', null, array('field_options' => array('expanded' => true, 'multiple' => true)))
    ;
  }
 
  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
      ->addIdentifier('name')
      ->add('real_time_start')
      ->add('posts')
      ->add('filePodcast')
    ;
  }
  
  public function validate(ErrorElement $errorElement, $object)
  {

  	$content=$this->mp32OggFile($object->getFilePodcast()->getProviderReference());
  	$media = new Media();
  	$media->setBinaryContent($content);
  	$media->setContext('user'); // video related to the user
  	$media->setProviderName('RadioSolution.provider.podcast');
  	
  	//$mediaManager= $this->get("sonata.media.manager.media");
  	//$mediaManager->save($media);
  	
  	$errorElement
  	->with('name')
  	->assertMaxLength(array('limit' => 32))
  	->end()
  	;
  }
  
  public function get()
  {
  	if (!$this->getRequest()) {
  		return array();
  	} 
  	return array(
  			'provider' => $this->getRequest()->get('provider'),
  			'context'  => $this->getRequest()->get('context'),
  	);
  }
  
  public function mp32OggFile($file, $delete = FALSE)
  {

  	if(file_exists("uploads/media/default/0001/01/$file"))
  	{
  		$res = @system(" ffmpeg -i uploads/media/default/0001/01/$file -vcodec libtheora -acodec libvorbis uploads/media/default/0001/01/$file.ogg");
  		if($delete == TRUE)
  		{
  			unlink($file);
  		}
  		return true;
  	}
  	else {
  		return false;
  	}
  }
}