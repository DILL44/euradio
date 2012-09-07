<?php

namespace RadioSolution\ProgramBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\ProgramBundle\Entity\EmissionFrequency
 */
class EmissionFrequency
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
     * @var time $hour
     */
    private $hour;


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
     * Set hour
     *
     * @param time $hour
     */
    public function setHour($hour)
    {
        $this->hour = $hour;
    }

    /**
     * Get hour
     *
     * @return time 
     */
    public function getHour()
    {
        return $this->hour;
    }
}