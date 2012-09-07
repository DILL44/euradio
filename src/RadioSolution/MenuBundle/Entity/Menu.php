<?php

namespace RadioSolution\MenuBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\MenuBundle\Entity\Menu
 */
class Menu
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
     * @var RadioSolution\MenuBundle\Entity\Item
     */
    private $links;

    public function __construct()
    {
        $this->links = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    /**
     * to string
     *
     * @return string
     */
    public function __toString()
    {
    	return $this->getName();
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
     * Add links
     *
     * @param RadioSolution\MenuBundle\Entity\Item $links
     */
    public function addItem(\RadioSolution\MenuBundle\Entity\Item $links)
    {
        $this->links[] = $links;
    }

    /**
     * Get links
     *
     * @return Doctrine\Common\Collections\Collection 
     */
    public function getLinks()
    {
        return $this->links;
    }
}