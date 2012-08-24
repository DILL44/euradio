<?php 
//src/Euradio/MenuBundle/Entity/Menu.php
namespace Euradio\MenuBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 */
class Menu{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	protected $id;
	
	/**
	 * @ORM\Column(type="string", length="255")
	 */
	protected $title;
	
	/**
	 * @ORM\Column(type="boolean")
	 */
	protected $enabled;
	
	/**
	 * @ORM\ManyToMany(targetEntity="Link")
	 */	
	protected $links;
	
	/**
	 * @ORM\ManyToMany(targetEntity="Submenu")
	 */
	protected $submenus;
	
	public function __toString()
	{
		return $this->getTitle();
	}
	
	public function __construct()
	{
		$this->links     = new \Doctrine\Common\Collections\ArrayCollection;
		$this->submenus = new \Doctrine\Common\Collections\ArrayCollection;
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
     * Set enabled
     *
     * @param boolean $enabled
     */
    public function setEnabled($enabled)
    {
        $this->enabled = $enabled;
    }

    /**
     * Get enabled
     *
     * @return boolean 
     */
    public function getEnabled()
    {
        return $this->enabled;
    }

    /**
     * Add links
     *
     * @param Euradio\MenuBundle\Entity\Link $links
     */
    public function addLink(\Euradio\MenuBundle\Entity\Link $links)
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

    /**
     * Add submenus
     *
     * @param Euradio\MenuBundle\Entity\Submenu $submenus
     */
    public function addSubmenu(\Euradio\MenuBundle\Entity\Submenu $submenus)
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
}