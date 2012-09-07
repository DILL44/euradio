<?php

namespace RadioSolution\MenuBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\MenuBundle\Entity\Item
 */
class Item
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
     * @var string $url
     */
    private $url;

    /**
     * @var RadioSolution\MenuBundle\Entity\Item
     */
    private $parent;

    /**
     * @var RadioSolution\MenuBundle\Entity\Menu
     */
    private $menu;

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
     * Set parent
     *
     * @param RadioSolution\MenuBundle\Entity\Item $parent
     */
    public function setParent(\RadioSolution\MenuBundle\Entity\Item $parent)
    {
        $this->parent = $parent;
    }

    /**
     * Get parent
     *
     * @return RadioSolution\MenuBundle\Entity\Item 
     */
    public function getParent()
    {
        return $this->parent;
    }

    /**
     * Set menu
     *
     * @param RadioSolution\MenuBundle\Entity\Menu $menu
     */
    public function setMenu(\RadioSolution\MenuBundle\Entity\Menu $menu)
    {
        $this->menu = $menu;
    }

    /**
     * Get menu
     *
     * @return RadioSolution\MenuBundle\Entity\Menu 
     */
    public function getMenu()
    {
        return $this->menu;
    }
}