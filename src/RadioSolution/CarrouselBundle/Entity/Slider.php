<?php

namespace RadioSolution\CarrouselBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\CarrouselBundle\Entity\Slider
 */
class Slider
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
     * @var RadioSolution\CarrouselBundle\Entity\Item
     */
    private $item;

    public function __construct()
    {
        $this->item = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Add item
     *
     * @param RadioSolution\CarrouselBundle\Entity\Item $item
     */
    public function addItem(\RadioSolution\CarrouselBundle\Entity\Item $item)
    {
        $this->item[] = $item;
    }

    /**
     * Get item
     *
     * @return Doctrine\Common\Collections\Collection 
     */
    public function getItem()
    {
        return $this->item;
    }
    
    public function getNbItem(){
    	$nb=0;
    	foreach ($this->item as $nbitem){
    		$nb++;
    	}
    	return $nb;
    }
    
    public function __toString(){
    	return $this->title;
    }
}