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
    /**
     * @var RadioSolution\ProgramBundle\Entity\ExceptionalBroadcast
     */
    private $ExceptionalBroadcast;

    /**
     * @var RadioSolution\ProgramBundle\Entity\WeeklyBroadcast
     */
    private $WeeklyBroadcast;

    public function __construct()
    {
        $this->ExceptionalBroadcast = new \Doctrine\Common\Collections\ArrayCollection();
    $this->WeeklyBroadcast = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    /**
     * Add ExceptionalBroadcast
     *
     * @param RadioSolution\ProgramBundle\Entity\ExceptionalBroadcast $exceptionalBroadcast
     */
    public function addExceptionalBroadcast(\RadioSolution\ProgramBundle\Entity\ExceptionalBroadcast $exceptionalBroadcast)
    {
        $this->ExceptionalBroadcast[] = $exceptionalBroadcast;
    }
    
    /**
     * Add ExceptionalBroadcast
     *
     * @param RadioSolution\ProgramBundle\Entity\ExceptionalBroadcast $exceptionalBroadcast
     */
    public function setExceptionalBroadcast(\Doctrine\Common\Collections\ArrayCollection $exceptionalBroadcast)
    {
    	$this->ExceptionalBroadcast = $exceptionalBroadcast;
    	return $this->ExceptionalBroadcast;
    }

    /**
     * Get ExceptionalBroadcast
     *
     * @return Doctrine\Common\Collections\Collection 
     */
    public function getExceptionalBroadcast()
    {
        return $this->ExceptionalBroadcast;
    }

    /**
     * Add WeeklyBroadcast
     *
     * @param RadioSolution\ProgramBundle\Entity\WeeklyBroadcast $weeklyBroadcast
     */
    public function addWeeklyBroadcast(\RadioSolution\ProgramBundle\Entity\WeeklyBroadcast $weeklyBroadcast)
    {
        $this->WeeklyBroadcast[] = $weeklyBroadcast;
    }

    /**
     * Add WeeklyBroadcast
     *
     * @param RadioSolution\ProgramBundle\Entity\WeeklyBroadcast $weeklyBroadcast
     */
    public function setWeeklyBroadcast(\Doctrine\Common\Collections\ArrayCollection $weeklyBroadcast)
    {
    	$this->WeeklyBroadcast = $weeklyBroadcast;
    	return $this->WeeklyBroadcast;
    }
    
    /**
     * Get WeeklyBroadcast
     *
     * @return Doctrine\Common\Collections\Collection 
     */
    public function getWeeklyBroadcast()
    {
        return $this->WeeklyBroadcast;
    }
    /**
     * @var date $diffusion_start
     */
    private $diffusion_start;

    /**
     * @var date $difusion_stop
     */
    private $difusion_stop;


    /**
     * Set diffusion_start
     *
     * @param date $diffusionStart
     */
    public function setDiffusionStart($diffusionStart)
    {
        $this->diffusion_start = $diffusionStart;
    }

    /**
     * Get diffusion_start
     *
     * @return date 
     */
    public function getDiffusionStart()
    {
        return $this->diffusion_start;
    }

    /**
     * Set difusion_stop
     *
     * @param date $difusionStop
     */
    public function setDifusionStop($difusionStop)
    {
        $this->difusion_stop = $difusionStop;
    }

    /**
     * Get difusion_stop
     *
     * @return date 
     */
    public function getDifusionStop()
    {
        return $this->difusion_stop;
    }
}