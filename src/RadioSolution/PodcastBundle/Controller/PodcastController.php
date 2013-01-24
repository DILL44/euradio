<?php

namespace RadioSolution\PodcastBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use RadioSolution\PodcastBundle\Entity\Podcast;

/**
 * Podcast controller.
 *
 * @Route("/podcast")
 */
class PodcastController extends Controller
{
    /**
     * Lists all Podcast entities.
     *
     * @Route("/", name="podcast")
     * @Template()
     */
    public function indexAction()
    {
    	$domain = $this->get('request')->server->get('HTTP_HOST');
    	$join='';
    	$condition='';
        if (isset($_GET['emission']) && $_GET['emission']!="") {
    		$join="JOIN p.program pr";
    		$post=$_GET['emission'];
    		$condition="AND  pr.emission= $post";
    		$em = $this->getDoctrine()->getEntityManager();
    		$query = $em->createQuery("SELECT p FROM PodcastBundle:Podcast p $join WHERE 1=1 $condition ORDER BY p.real_time_start DESC");
    		$entities=$query->getResult();
    	}else{
	    	$date=new \DateTime('-7 month');
			$em = $this->getDoctrine()->getEntityManager();
			$query = $em->createQuery("SELECT p FROM PodcastBundle:Podcast p $join WHERE  p.real_time_start>:date $condition ORDER BY p.real_time_start DESC")->setParameter('date', $date);
			$entities=$query->getResult();
    	}
		$query = $em->createQuery("SELECT e FROM ProgramBundle:Emission e ");
		$emission=$query->getResult();
        
        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
        		$entities,
        		$this->get('request')->query->get('page', 1),
        		10
        );
        return $this->render('PodcastBundle:Podcast:index.html.twig',array('pagination'=> $pagination,'emissions'=>$emission,'domain'=>$domain));
    }
    
    /**
     * Lists all Podcast entities.
     *
     * @Route("/", name="podcast")
     * @Template()
     */
    public function indexDateAction($date)
    {
    	$domain = $this->get('request')->server->get('HTTP_HOST');
    	$join='';
    	$condition='';
    	if (isset($_GET['emission']) && $_GET['emission']!="") {
    		$join="JOIN p.program pr";
    		$post=$_GET['emission'];
    		$condition="AND  pr.emission= $post";
    	}
    	$dateStart=new \DateTime($date);
    	$dateStart->setTime(00, 00);
    	$dateStop=new \DateTime($date);
    	$dateStop->setTime(23, 59);
    	$em = $this->getDoctrine()->getEntityManager();
    	$query = $em->createQuery("SELECT p FROM PodcastBundle:Podcast p $join WHERE  p.real_time_start>:dateStart AND p.real_time_start<:dateStop $condition ORDER BY p.real_time_start DESC")->setParameters(array('dateStart'=> $dateStart,'dateStop'=> $dateStop));
    	$entities=$query->getResult();
    
    	$query = $em->createQuery("SELECT e FROM ProgramBundle:Emission e ");
    	$emission=$query->getResult();
    	
    	$paginator = $this->get('knp_paginator');
    	$pagination = $paginator->paginate(
    			$entities,
    			$this->get('request')->query->get('page', 1),
    			10
    	);
    	return $this->render('PodcastBundle:Podcast:indexDate.html.twig',array('pagination'=> $pagination,'emissions'=>$emission,'date'=>$date,'domain'=>$domain));

    }

    /**
     * Finds and displays a Podcast entity.
     *
     * @Route("/{id}/show", name="podcast_show")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entity = $em->getRepository('PodcastBundle:Podcast')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Podcast entity.');
        }

        return array(
            'entity'      => $entity,
        );
    }
    
    public function EmissionAction($id,$page)
    {
    	if ($page=='')$page=1;
    	$em = $this->getDoctrine()->getEntityManager();
    	$query = $em->createQuery("SELECT p FROM PodcastBundle:Podcast p JOIN p.program pr WHERE  pr.emission=:idEmission ORDER BY p.real_time_start DESC")->setParameter('idEmission', $id);
    	$entities=$query->getResult();
    
    	$paginator = $this->get('knp_paginator');
    	$pagination = $paginator->paginate(
    			$entities,
    			$this->get('request')->query->get('page', $page),
    			6
    	);
    	return $this->render('PodcastBundle:Podcast:Emission.html.twig',array('pagination'=> $pagination));

    }
}
