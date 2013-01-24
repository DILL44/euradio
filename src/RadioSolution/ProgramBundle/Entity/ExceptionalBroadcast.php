<?php

namespace RadioSolution\ProgramBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\ProgramBundle\Entity\ExceptionalBroadcast
 */
class ExceptionalBroadcast
{
    /**
     * @var integer $id
     */
    private $id;

    /**
     * @var datetime $time_start
     */
    private $time_start;

    /**
     * @var time $duration
     */
    private $duration;

    /**
     * @var RadioSolution\ProgramBundle\Entity\Emission
     */
    private $Emission;


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
     * Set time_start
     *
     * @param datetime $timeStart
     */
    public function setTimeStart($timeStart)
    {
        $this->time_start = $timeStart;
        return $this->time_start;
    }

    /**
     * Get time_start
     *
     * @return datetime 
     */
    public function getTimeStart()
    {
        return $this->time_start;
    }

    /**
     * Set duration
     *
     * @param time $duration
     */
    public function setDuration($duration)
    {
        $this->duration = $duration;
        return $this->duration;
    }

    /**
     * Get duration
     *
     * @return time 
     */
    public function getDuration()
    {
        return $this->duration;
    }

    /**
     * Set Emission
     *
     * @param RadioSolution\ProgramBundle\Entity\Emission $emission
     */
    public function setEmission(\RadioSolution\ProgramBundle\Entity\Emission $emission)
    {
        $this->Emission = $emission;
    }

    /**
     * Get Emission
     *
     * @return RadioSolution\ProgramBundle\Entity\Emission 
     */
    public function getEmission()
    {
        return $this->Emission;
    }
    /**
     * to string
     *
     * @return string
     */
    public function __toString()
    {    	
    	$idst=(string)$this->getId();
    	$durationstr=strval($this->getDuration()->format('Y-m-d H:i'));
    	return "$idst $durationstr";
    }
    
}