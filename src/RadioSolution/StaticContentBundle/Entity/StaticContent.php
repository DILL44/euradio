<?php

namespace RadioSolution\StaticContentBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\StaticContentBundle\Entity\StaticContent
 */
class StaticContent
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
     * @var string $name
     */
    private $name;

    /**
     * @var string $introduction
     */
    private $introduction;

    /**
     * @var string $body
     */
    private $body;

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
     * Set introduction
     *
     * @param string $introduction
     */
    public function setIntroduction($introduction)
    {
        $this->introduction = $introduction;
    }

    /**
     * Get introduction
     *
     * @return string 
     */
    public function getIntroduction()
    {
        return $this->introduction;
    }

    /**
     * Set body
     *
     * @param string $body
     */
    public function setBody($body)
    {
        $this->body = $body;
    }

    /**
     * Get body
     *
     * @return string 
     */
    public function getBody()
    {
        return $this->body;
    }
    /**
     * @var RadioSolution\StaticContentBundle\Entity\CategoryStaticContent
     */
    private $CategoryStaticContent;


    /**
     * Set CategoryStaticContent
     *
     * @param RadioSolution\StaticContentBundle\Entity\CategoryStaticContent $categoryStaticContent
     */
    public function setCategoryStaticContent(\RadioSolution\StaticContentBundle\Entity\CategoryStaticContent $categoryStaticContent)
    {
        $this->CategoryStaticContent = $categoryStaticContent;
    }

    /**
     * Get CategoryStaticContent
     *
     * @return RadioSolution\StaticContentBundle\Entity\CategoryStaticContent 
     */
    public function getCategoryStaticContent()
    {
        return $this->CategoryStaticContent;
    }
    /**
     * @var date $date_add
     */
    private $date_add;


    /**
     * Set date_add
     *
     * @param date $dateAdd
     */
    public function setDateAdd($dateAdd)
    {
        $this->date_add = $dateAdd;
    }

    /**
     * Get date_add
     *
     * @return date 
     */
    public function getDateAdd()
    {
        return $this->date_add;
    }
    /**
     * @var Application\Sonata\MediaBundle\Entity\Media
     */
    private $image;


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