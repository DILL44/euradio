<?php

namespace RadioSolution\ProgramBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\ProgramBundle\Entity\ThemeColor
 */
class ThemeColor
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
     * @var integer $html_code
     */
    private $html_code;

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
     * Set html_code
     *
     * @param integer $htmlCode
     */
    public function setHtmlCode($htmlCode)
    {
        $this->html_code = $htmlCode;
    }

    /**
     * Get html_code
     *
     * @return integer 
     */
    public function getHtmlCode()
    {
        return $this->html_code;
    }
}