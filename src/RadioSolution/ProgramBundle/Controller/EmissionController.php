<?php

namespace RadioSolution\ProgramBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use RadioSolution\ProgramBundle\Entity\Emission;

/**
 * Emission controller.
 *
 * @Route("/")
 */
class EmissionController extends Controller
{
    /**
     * Lists all Emission entities.
     *
     * @Route("/", name="")
     * @Template()
     */
	/*
    public function indexAction()
    {
    	$condition1='';
    	$condition2='';
    	$getTheme='';
    	$getFrequency='';
    	if (isset($_GET['theme'])) {
    		$getTheme=$_GET['theme'];
    		if ($getTheme!="")$condition1="AND  e.theme= $getTheme";
    	}
    	if (isset($_GET['frequency'])) {
    		$getFrequency=$_GET['frequency'];
    		if ($getFrequency!="")$condition2="AND  e.frequency= $getFrequency";
    	}
    	$em = $this->getDoctrine()->getEntityManager();
    	$query = $em->createQuery("SELECT e FROM ProgramBundle:Emission e WHERE e.archive=:archiveEmission $condition1 $condition2 ORDER BY e.id DESC")
    	->setMaxResults(1000)
    	->setParameter('archiveEmission', '0');  	
    	$entities=$query->getResult();
    	
    	$query = $em->createQuery("SELECT e FROM ProgramBundle:EmissionTheme e");
    	$theme=$query->getResult();
    	
    	$query = $em->createQuery("SELECT e FROM ProgramBundle:EmissionFrequency e");    	 
    	$frequency=$query->getResult();
    	
        $paginator = $this->get('knp_paginator');
        
        $pagination = $paginator->paginate(
        		$entities,
        		$this->get('request')->query->get('page', 1),
        		6
        );
        
        return $this->render('ProgramBundle:Emission:index.html.twig',array(
        		'pagination'=>$pagination,
        		'frequencies'=>$frequency,
        		'themes'=>$theme,
        		'gt'=>$getTheme,
        		'gf'=>$getFrequency));
    }
	*/
	
	public function indexAction()
	{
		$condition1='';
		$condition2='';
		$condition3='';
		$getTheme='';
		$getFrequency='';
		$getArchive='';
		if (isset($_GET['theme']) && $_GET['theme']!="") {
			$getTheme=$_GET['theme'];
			if ($getTheme!="")$condition1="AND  e.theme= $getTheme";
		}
		if (isset($_GET['frequency']) && $_GET['frequency']!="") {
			$getFrequency=$_GET['frequency'];
			if ($getFrequency!="")$condition2="AND  e.frequency= $getFrequency";
		}
		if (isset($_GET['archive']) && $_GET['archive']!="") {
			$getArchive=$_GET['archive'];
			if ($getArchive!="")$condition3="AND  e.archive= $getArchive";
		}else{
			$condition3="AND  e.archive=0";
		}
		$em = $this->getDoctrine()->getEntityManager();
		$query = $em->createQuery("SELECT e FROM ProgramBundle:Emission e WHERE e.name!='' $condition1 $condition2 $condition3 ORDER BY e.id DESC")
		->setMaxResults(1000);
		//->setParameter('archiveEmission', '0');
		$entities=$query->getResult();
		 
		$query = $em->createQuery("SELECT e FROM ProgramBundle:EmissionTheme e");
		$theme=$query->getResult();
		 
		$query = $em->createQuery("SELECT e FROM ProgramBundle:EmissionFrequency e");
		$frequency=$query->getResult();
		 
		$paginator = $this->get('knp_paginator');
	
		$pagination = $paginator->paginate(
				$entities,
				$this->get('request')->query->get('page', 1),
				6
		);
	
		return $this->render('ProgramBundle:Emission:index.html.twig',array(
				'pagination'=>$pagination,
				'frequencies'=>$frequency,
				'themes'=>$theme,
				'gt'=>$getTheme,
				'gf'=>$getFrequency,
				'ga' => $getArchive));
	}
	
	
    /**
     * Finds and displays a Emission entity.
     *
     * @Route("/{id}/show", name="_show")
     * @Template()
     */
    public function showAction($name)
    {
        $em = $this->getDoctrine()->getEntityManager();
        $entity = $em->getRepository('ProgramBundle:Emission')->findBySlug($name);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Emission entity.');
        }
        return array(
            'entitie'      => $entity,
        );
    }
    
    public function showRssAction($name)
    {
    	$domain = $this->get('request')->server->get('HTTP_HOST');
    	$em = $this->getDoctrine()->getEntityManager();
    	$emission = $em->getRepository('ProgramBundle:Emission')->findBySlug($name);
    	$query = $em->createQuery("SELECT p FROM PodcastBundle:Podcast p JOIN p.program pr WHERE  pr.emission=:idEmission ORDER BY p.real_time_start DESC")->setMaxResults(10)
    	->setParameter('idEmission',$emission[0]->getId());
    	$podcast=$query->getResult();

    	return $this->render('ProgramBundle:Emission:show.rss.twig',array(
    			'emission'      => $emission[0],
    			'podcasts'      	=> $podcast,
    			'domain'		=> $domain,
    	));
    }
}
