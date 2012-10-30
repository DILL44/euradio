<?php

namespace RadioSolution\ProgramBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\ProgramBundle\Entity\Day
 */
class Day
{
    /**
     * @var integer $id
     */
    private $id;

    /**
     * @var string $time_start
     */
    private $time_start;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->getTimeStart();
    }

    /**
     * Set time_start
     *
     * @param string $timeStart
     */
    public function setTimeStart($timeStart)
    {
        $this->time_start = $timeStart;
    }

    /**
     * Get time_start
     *
     * @return string 
     */
    public function getTimeStart()
    {
        return $this->time_start;
    }
    
    /**
     * to string
     *
     * @return string
     */
    public function __toString()
    {
    	return (String)$this->getId();
    }
    
}