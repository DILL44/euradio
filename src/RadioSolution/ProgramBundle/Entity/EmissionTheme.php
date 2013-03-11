<?php

namespace RadioSolution\ProgramBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\ProgramBundle\Entity\EmissionTheme
 */
class EmissionTheme
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
     * @var RadioSolution\ProgramBundle\Entity\ThemeColor
     */
    private $type;

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
     * Set type
     *
     * @param RadioSolution\ProgramBundle\Entity\ThemeColor $type
     */
    public function setType(\RadioSolution\ProgramBundle\Entity\ThemeColor $type)
    {
        $this->type = $type;
    }

    /**
     * Get type
     *
     * @return RadioSolution\ProgramBundle\Entity\ThemeColor 
     */
    public function getType()
    {
        return $this->type;
    }
}