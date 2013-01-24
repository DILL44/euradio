<?php

namespace RadioSolution\StaticContentBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Sonata\NewsBundle\Model\Tag as Tag;

/**
 * RadioSolution\StaticContentBundle\Entity\CategoryStaticContent
 */
class CategoryStaticContent
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
     * @var string $body
     */
    private $body;

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
        $this->setSlug(Tag::slugify($name));
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
    /**
     * @var string $slug
     */
    private $slug;


    /**
     * Set slug
     *
     * @param string $slug
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;
    }

    /**
     * Get slug
     *
     * @return string 
     */
    public function getSlug()
    {
        return $this->slug;
    }
    /**
     * @var RadioSolution\StaticContentBundle\Entity\CategoryStaticContent
     */
    private $parent;


    /**
     * Set parent
     *
     * @param RadioSolution\StaticContentBundle\Entity\CategoryStaticContent $parent
     */
    public function setParent(\RadioSolution\StaticContentBundle\Entity\CategoryStaticContent $parent)
    {
        $this->parent = $parent;
    }

    /**
     * Get parent
     *
     * @return RadioSolution\StaticContentBundle\Entity\CategoryStaticContent 
     */
    public function getParent()
    {
        return $this->parent;
    }
}