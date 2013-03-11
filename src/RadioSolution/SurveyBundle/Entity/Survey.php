<?php

namespace RadioSolution\SurveyBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\SurveyBundle\Entity\Survey
 */
class Survey
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
     * @var text $script
     */
    private $script;

    /**
     * @var boolean $enable
     */
    private $enable;


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
     * Set script
     *
     * @param text $script
     */
    public function setScript($script)
    {
        $this->script = $script;
    }

    /**
     * Get script
     *
     * @return text 
     */
    public function getScript()
    {
        return $this->script;
    }

    /**
     * Set enable
     *
     * @param boolean $enable
     */
    public function setEnable($enable)
    {
        $this->enable = $enable;
    }

    /**
     * Get enable
     *
     * @return boolean 
     */
    public function getEnable()
    {
        return $this->enable;
    }
}