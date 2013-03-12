<?php

namespace RadioSolution\CarrouselBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\CarrouselBundle\Entity\CustomItem
 */
class CustomItem
{
    /**
     * @var integer $id
     */
    private $id;

    /**
     * @var string $title
     */
    private $title;

    /**
     * @var string $url
     */
    private $url;

    /**
     * @var Application\Sonata\MediaBundle\Entity\Media
     */
    private $image;


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
     * Set title
     *
     * @param string $title
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }

    /**
     * Get title
     *
     * @return string 
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set url
     *
     * @param string $url
     */
    public function setUrl($url)
    {
        $this->url = $url;
    }

    /**
     * Get url
     *
     * @return string 
     */
    public function getUrl()
    {
        return $this->url;
    }

    /**
     * Set image
     *
     * @param Application\Sonata\MediaBundle\Entity\Media $image
     */
    public function setImage(\Application\Sonata\MediaBundle\Entity\Media $image)
    {
        $this->image = $image;
    }

    /**
     * Get image
     *
     * @return Application\Sonata\MediaBundle\Entity\Media 
     */
    public function getImage()
    {
        return $this->image;
    }
}