<?php

namespace RadioSolution\ProgramBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\ProgramBundle\Entity\WeeklyBroadcast
 */
class WeeklyBroadcast
{
    /**
     * @var integer $id
     */
    private $id;

    /**
     * @var time $duration
     */
    private $duration;

    /**
     * @var time $hour
     */
    private $hour;

    /**
     * @var integer $day
     */
    private $day;

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
     * Set duration
     *
     * @param time $duration
     */
    public function setDuration($duration)
    {
        $this->duration = $duration;
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

    /**
     * Set day
     *
     * @param integer $day
     */
    public function setDay($day)
    {
        $this->day = $day;
    }

    /**
     * Get day
     *
     * @return integer 
     */
    public function getDay()
    {
        return $this->day;
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
}