<?php
/**
 * This file is part of the <name> project.
 *
 * (c) <yourname> <youremail>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Application\Sonata\NewsBundle\Entity;

use RadioSolution\PodcastBundle\Entity\Podcast;

use Sonata\NewsBundle\Entity\BasePost as BasePost;

/**
 * This file has been generated by the Sonata EasyExtends bundle ( http://sonata-project.org/easy-extends )
 *
 * References :
 *   working with object : http://www.doctrine-project.org/projects/orm/2.0/docs/reference/working-with-objects/en
 *
 * @author <yourname> <youremail>
 */
class Post extends BasePost
{
	
    /**
     * @var integer $id
     */
    protected $id;
    
    /**
     * @var podcast $postcast
     */
    protected $podcast;

    /**
     * Get id
     *
     * @return integer $id
     */
    public function getId()
    {
        return $this->id;
    }
    /**
     * Get id
     *
     * @return integer $id
     */
    public function setId($id)
    {
    	return $this->id=$id;
    }
    /**
     * Get podcast
     *
     * @return Podcast $podcast
     */
    public function getPodcast()
    {
    	return $this->podcast;
    }

    
    public function getFilePodcast()
    {
    	return $this->podcast->getFilePodcast()->getProviderReference();
    }
    
    public function getMediaPodcast()
    {
    	if ($this->podcast!=NULL)
    	return $this->podcast->getFilePodcast();
    }
    
    /**
     * Get podcast
     *
     * @return Podcast $podcast
     */
    public function setPodcast(\RadioSolution\PodcastBundle\Entity\Podcast $podcast)
    {
    	$this->podcast=$podcast;
    }
    
    protected $image;
    
    public function getImage()
    {
    	
    	if(!$this->image){
    		
    		if($this->getPodcast()){
    			
    			$podcast = $this->getPodcast();
    			
    			if($podcast->getEmission()){
    				
    				$this->image =$podcast->getImageEmission();
    			
    			}

    		}
    		
    	}
    	
    	return $this->image;
    	
    }   
    
    public function setImage(\Application\Sonata\MediaBundle\Entity\Media $image=NULL)
    {
    	$this->image=$image;
    }
    
}