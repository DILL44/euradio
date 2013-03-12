<?php

namespace RadioSolution\CarrouselBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RadioSolution\CarrouselBundle\Entity\Item
 */
class Item
{
    /**
     * @var integer $id
     */
    private $id;

    /**
     * @var integer $order_int
     */
    private $order_int;

    /**
     * @var RadioSolution\StaticContentBundle\Entity\CategoryStaticContent
     */
    private $category_static_content;

    /**
     * @var RadioSolution\StaticContentBundle\Entity\StaticContent
     */
    private $static_content;

    /**
     * @var RadioSolution\ProgramBundle\Entity\Emission
     */
    private $emission;

    /**
     * @var RadioSolution\PodcastBundle\Entity\Podcast
     */
    private $podcast;

    /**
     * @var RadioSolution\CarrouselBundle\Entity\CustomItem
     */
    private $custum_item;

    /**
     * @var RadioSolution\CarrouselBundle\Entity\Slider
     */
    private $slider;


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
     * Set order_int
     *
     * @param integer $orderInt
     */
    public function setOrderInt($orderInt)
    {
        $this->order_int = $orderInt;
    }

    /**
     * Get order_int
     *
     * @return integer 
     */
    public function getOrderInt()
    {
        return $this->order_int;
    }

    /**
     * Set category_static_content
     *
     * @param RadioSolution\StaticContentBundle\Entity\CategoryStaticContent $categoryStaticContent
     */
    public function setCategoryStaticContent(\RadioSolution\StaticContentBundle\Entity\CategoryStaticContent $categoryStaticContent)
    {
        $this->category_static_content = $categoryStaticContent;
    }

    /**
     * Get category_static_content
     *
     * @return RadioSolution\StaticContentBundle\Entity\CategoryStaticContent 
     */
    public function getCategoryStaticContent()
    {
        return $this->category_static_content;
    }

    /**
     * Set static_content
     *
     * @param RadioSolution\StaticContentBundle\Entity\StaticContent $staticContent
     */
    public function setStaticContent(\RadioSolution\StaticContentBundle\Entity\StaticContent $staticContent)
    {
        $this->static_content = $staticContent;
    }

    /**
     * Get static_content
     *
     * @return RadioSolution\StaticContentBundle\Entity\StaticContent 
     */
    public function getStaticContent()
    {
        return $this->static_content;
    }

    /**
     * Set emission
     *
     * @param RadioSolution\ProgramBundle\Entity\Emission $emission
     */
    public function setEmission(\RadioSolution\ProgramBundle\Entity\Emission $emission)
    {
        $this->emission = $emission;
    }

    /**
     * Get emission
     *
     * @return RadioSolution\ProgramBundle\Entity\Emission 
     */
    public function getEmission()
    {
        return $this->emission;
    }

    /**
     * Set podcast
     *
     * @param RadioSolution\PodcastBundle\Entity\Podcast $podcast
     */
    public function setPodcast(\RadioSolution\PodcastBundle\Entity\Podcast $podcast)
    {
        $this->podcast = $podcast;
    }

    /**
     * Get podcast
     *
     * @return RadioSolution\PodcastBundle\Entity\Podcast 
     */
    public function getPodcast()
    {
        return $this->podcast;
    }

    /**
     * Set custum_item
     *
     * @param RadioSolution\CarrouselBundle\Entity\CustomItem $custumItem
     */
    public function setCustumItem(\RadioSolution\CarrouselBundle\Entity\CustomItem $custumItem)
    {
        $this->custum_item = $custumItem;
    }

    /**
     * Get custum_item
     *
     * @return RadioSolution\CarrouselBundle\Entity\CustomItem 
     */
    public function getCustumItem()
    {
        return $this->custum_item;
    }

    /**
     * Set slider
     *
     * @param RadioSolution\CarrouselBundle\Entity\Slider $slider
     */
    public function setSlider(\RadioSolution\CarrouselBundle\Entity\Slider $slider)
    {
        $this->slider = $slider;
    }

    /**
     * Get slider
     *
     * @return RadioSolution\CarrouselBundle\Entity\Slider 
     */
    public function getSlider()
    {
        return $this->slider;
    }
    public function __toString(){
    	return (String)$this->order_int;
    }
}