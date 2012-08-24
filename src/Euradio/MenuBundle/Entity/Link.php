<?php 
//src/Euradio/MenuBundle/Entity/Link.php
namespace Euradio\MenuBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 */
class Link{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	protected $id;
	
	/**
	 * @ORM\Column(type="string", length="255")
	 * @validation:Validation({
	 *      @validation:MinLength(limit=5),
	 *      @validation:NotBlank(),
	 *      @validation:MaxLength(limit=255)
	 * })
	 */
	protected $title;
	
	/**
	 * @ORM\Column(type="boolean")
	 */
	protected $url;
	
	/**
	 * @ORM\Column(type="string", length="255")
	 */
	protected $adress;
	
	public function __toString()
	{
		return $this->getTitle();
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
     * Set url
     *
     * @param boolean $url
     */
    public function setUrl($url)
    {
        $this->url = $url;
    }

    /**
     * Get url
     *
     * @return boolean 
     */
    public function getUrl()
    {
        return $this->url;
    }

    /**
     * Set adress
     *
     * @param string $adress
     */
    public function setAdress($adress)
    {
        $this->adress = $adress;
    }

    /**
     * Get adress
     *
     * @return string 
     */
    public function getAdress()
    {
        return $this->adress;
    }
}