<?php

namespace RadioSolution\ProgramBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\ProgramBundle\Entity\Emission
 */
class Emission
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
     * @var string $description
     */
    private $description;

    /**
     * @var RadioSolution\ProgramBundle\Entity\EmissionTheme
     */
    private $theme;

    /**
     * @var RadioSolution\ProgramBundle\Entity\EmissionFrequency
     */
    private $frenquence;

    /**
     * @var Application\Sonata\UserBundle\Entity\Group
     */
    private $group;

    /**
     * @var Application\Sonata\MediaBundle\Entity\Media
     */
    private $media;

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
     * Set description
     *
     * @param string $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set theme
     *
     * @param RadioSolution\ProgramBundle\Entity\EmissionTheme $theme
     */
    public function setTheme(\RadioSolution\ProgramBundle\Entity\EmissionTheme $theme)
    {
        $this->theme = $theme;
    }

    /**
     * Get theme
     *
     * @return RadioSolution\ProgramBundle\Entity\EmissionTheme 
     */
    public function getTheme()
    {
        return $this->theme;
    }

    /**
     * Set frenquence
     *
     * @param RadioSolution\ProgramBundle\Entity\EmissionFrequency $frenquence
     */
    public function setFrenquence(\RadioSolution\ProgramBundle\Entity\EmissionFrequency $frenquence)
    {
        $this->frenquence = $frenquence;
    }

    /**
     * Get frenquence
     *
     * @return RadioSolution\ProgramBundle\Entity\EmissionFrequency 
     */
    public function getFrenquence()
    {
        return $this->frenquence;
    }

    /**
     * Set group
     *
     * @param Application\Sonata\UserBundle\Entity\Group $group
     */
    public function setGroup(\Application\Sonata\UserBundle\Entity\Group $group)
    {
        $this->group = $group;
    }

    /**
     * Get group
     *
     * @return Application\Sonata\UserBundle\Entity\Group 
     */
    public function getGroup()
    {
        return $this->group;
    }

    /**
     * Set media
     *
     * @param Application\Sonata\MediaBundle\Entity\Media $media
     */
    public function setMedia(\Application\Sonata\MediaBundle\Entity\Media $media)
    {
        $this->media = $media;
    }

    /**
     * Get media
     *
     * @return Application\Sonata\MediaBundle\Entity\Media 
     */
    public function getMedia()
    {
        return $this->media;
    }
}