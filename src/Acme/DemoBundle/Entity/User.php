<?php
// src/Acme/DemoBundle/Entity/User.php

namespace Acme\DemoBundle\Entity;

use FOS\UserBundle\Entity\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="fos_user")
 */
class User extends BaseUser
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;
    /**
     * @ORM\ManyToMany(targetEntity="Acme\DemoBundle\Entity\Group")
     * @ORM\JoinTable(name="fos_user_user_group",
     *      joinColumns={@ORM\JoinColumn(name="user_id", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="group_id", referencedColumnName="id")}
     * )
     */
    protected $groups;
    protected $twitterID;
    protected $twitter_username;

    public function __construct()
    {
        parent::__construct();
        // your own logic
    }
    public function getGroupsApp(){
    	$result='';
    	foreach ($this->groups as $value){
    		$result.=' '.$value;
    	}
    	return $result;
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
     * Get groups
     *
     * @return Doctrine\Common\Collections\Collection 
     */
    public function getGroups()
    {
        return $this->groups;
    }
    
    public function setTwitterID($twitterID)
    {
    	$this->twitterID = $twitterID;
    	$this->setUsername($twitterID);
    	$this->salt = '';
    }
    
    public function getTwitterID()
    {
    	return $this->twitterID;
    }
    
    public function setTwitterUsername($twitterUsername)
    {
    	$this->twitter_username = $twitterUsername;
    }
    
    public function getTwitterUsername()
    {
    	return $this->twitter_username;
    }
}