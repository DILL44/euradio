<?php

namespace RadioSolution\PubBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\PubBundle\Entity\Pub
 */
class Pub
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
     * @var boolean $enable
     */
    private $enable;

    /**
     * @var Application\Sonata\MediaBundle\Entity\Media
     */
    private $image;
    
    
    private $order_pub;


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
     * Set enable
     *
     * @param boolean $enable
     */
    public function setEnable($enable)
    {
        $this->enable = $enable;
    }

    /**
     * Get enable
     *
     * @return boolean 
     */
    public function getEnable()
    {
        return $this->enable;
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
    /**
     * @var string $link
     */
    private $link;


    /**
     * Set link
     *
     * @param string $link
     */
    public function setLink($link)
    {
        $this->link = $link;
    }

    /**
     * Get link
     *
     * @return string 
     */
    public function getOrderPub()
    {
        return $this->order_pub;
    }
    
    public function setOrderPub($order_pub)
    {
    	$this->order_pub = $order_pub;
    }
    
    /**
     * Get link
     *
     * @return string
     */
    public function getLink()
    {
    	return $this->link;
    }
}