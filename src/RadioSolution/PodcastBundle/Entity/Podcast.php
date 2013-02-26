<?php

namespace RadioSolution\PodcastBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\PodcastBundle\Entity\Podcast
 */
class Podcast
{
    /**
     * @var integer $id
     */
    private $id;

    /**
     * @var string $name
     */
    private $name;

    /**
     * @var datetime $real_time_start
     */
    private $real_time_start;

    /**
     * @var Application\Sonata\MediaBundle\Entity\Media
     */
    private $filePodcast;

    
    private $dlAuth;
    
    /**
     * @var Application\Sonata\NewsBundle\Entity\Post
     */
    private $post;
    
    private $home_page;


    public function __construct()
    {
    	$this->real_time_start = new \DateTime('now');
    	$this->dlAuth = true;

    }
    
    
    
    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set name
     *
     * @param string $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set real_time_start
     *
     * @param datetime $realTimeStart
     */
    public function setRealTimeStart($realTimeStart)
    {
        $this->real_time_start = $realTimeStart;
    }

    /**
     * Get real_time_start
     *
     * @return datetime 
     */
    public function getRealTimeStart()
    {
        return $this->real_time_start;
    }

   
    
    /**
     * Set dlauth
     *
     * @param Application\Sonata\MediaBundle\Entity\Media $filePodcast
     */
    public function setDlAuth($dlAuth)
    {
    	$this->dlAuth = $dlAuth;
    }
    
    /**
     * Get filePodcast
     *
     * @return Application\Sonata\MediaBundle\Entity\Media
     */
    public function getDlAuth()
    {
    	return $this->dlAuth;
    }
    
    
    
    
    /**
     * Set filePodcast
     *
     * @param Application\Sonata\MediaBundle\Entity\Media $filePodcast
     */
    public function setFilePodcast(\Application\Sonata\MediaBundle\Entity\Media $filePodcast)
    {
        $this->filePodcast = $filePodcast;
    }

    /**
     * Get filePodcast
     *
     * @return Application\Sonata\MediaBundle\Entity\Media 
     */
    public function getFilePodcast()
    {
        return $this->filePodcast;
    }

    /**
     * Set post
     *
     * @param Application\Sonata\NewsBundle\Entity\Post $post
     */
    public function setPost(\Application\Sonata\NewsBundle\Entity\Post $post)
    {
        $this->post = $post;
    }

    /**
     * Get post
     *
     * @return Application\Sonata\NewsBundle\Entity\Post 
     */
    public function getPost()
    {
        return $this->post;
    }
    public function getPostTitle()
    {
    	return $this->post->getTitle();
    }
    public function getPostAbstract()
    {
    	return $this->post->getAbstract();
    }
    public function getPostImage()
    {
    	return $this->post->getImage();
    }
    public function getSlug()
    {
    	return $this->post->getYear().'/'.$this->post->getMonth().'/'.$this->post->getDay().'/'.$this->post->getSlug();
    }
    public  function __toString(){
    	return $this->getName();
    }
    

    /**
     * @var RadioSolution\ProgramBundle\Entity\Program
     */
    private $program;


    /**
     * Set program
     *
     * @param RadioSolution\ProgramBundle\Entity\Program $program
     */
    public function setProgram(\RadioSolution\ProgramBundle\Entity\Program $program)
    {
        $this->program = $program;
    }

    /**
     * Get program
     *
     * @return RadioSolution\ProgramBundle\Entity\Program 
     */
    public function getProgram()
    {
        return $this->program;
    } 
    
    public function getEmission()
    {
        return $this->program->getEmission()->getName();
    }
    
    public function getImageEmission()
    {
    	return $this->program->getEmission()->getMedia();
    }
    
    public function getHomePage(){
    	return $this->home_page;
    }
    
    public function setHomePage($homePage){
    	$this->home_page=$homePage;
    }
}