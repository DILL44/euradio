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

    /**
     * @var Application\Sonata\NewsBundle\Entity\Post
     */
    private $post;


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
    
    public  function __toString(){
    	return $this->getName();
    }
}