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
     * @var RadioSolution\MenuBundle\Entity\SubMenu
     */
    private $submenus;

    /**
     * @var RadioSolution\MenuBundle\Entity\Link
     */
    private $links;

    public function __construct()
    {
        $this->submenus = new \Doctrine\Common\Collections\ArrayCollection();
    $this->links = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    public function __toString(){
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
     * Add submenus
     *
     * @param RadioSolution\MenuBundle\Entity\SubMenu $submenus
     */
    public function addSubMenu(\RadioSolution\MenuBundle\Entity\SubMenu $submenus)
    {
        $this->submenus[] = $submenus;
    }

    /**
     * Get submenus
     *
     * @return Doctrine\Common\Collections\Collection 
     */
    public function getSubmenus()
    {
        return $this->submenus;
    }

    /**
     * Add links
     *
     * @param RadioSolution\MenuBundle\Entity\Link $links
     */
    public function addLink(\RadioSolution\MenuBundle\Entity\Link $links)
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