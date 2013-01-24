<?php

namespace RadioSolution\ProgramBundle\Controller;

use Sonata\PageBundle\Form\Type\TemplateChoiceType;

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
class EcouteController extends Controller
{ 

    public function indexAction()
    {
    	$day=new \DateTime('now');
    	$start=new \DateTime('now'); 
    	$start->setTime('00', '00');
    	$stop=new \DateTime('now');
    	$stop->setTime('23', '59', '59');

    	
    	$em = $this->getDoctrine()->getEntityManager();
    	
    	$query = $em->createQuery("SELECT p FROM ProgramBundle:Program p WHERE p.time_stop<:stop AND p.time_start>:start ORDER BY p.time_start ASC")
    	->setParameters(array('start'=>$start,'stop'=>$stop));
    	$entities=$query->getResult();
    	
    	$query = $em->createQuery("SELECT p FROM ProgramBundle:Program p WHERE p.time_stop>:now AND p.time_start<:now ORDER BY p.time_start ASC")
    	->setParameters(array('now'=>$day))
    	->setMaxResults(1);
    	$currentProgram=$query->getResult();
    	
    	//echo "".$currentProgram[0]->getName()."<br/>";
    	
    	$nowSlide = 0;
    	
    	if(is_array($currentProgram) && count($currentProgram) > 0){
    		
    		$somethingNow = true;
    		
    	}else{
    		
    		$somethingNow = false;
    		
    		$query = $em->createQuery("SELECT p FROM ProgramBundle:Program p WHERE p.time_start>:now ORDER BY p.time_start ASC")
    		->setParameters(array('now'=>$day))
    		->setMaxResults(1);
    		$currentProgram=$query->getResult();
    		
    	}
    	
    	$nowSlide = array_search($currentProgram[0], $entities)+1;
    	
    	$json = file_get_contents('http://api.twitter.com/1/statuses/user_timeline/euradionantes.json?callback=?');
    	$status = json_decode($json);
    	$tweets= array();
    	
    	foreach($status as $tweet){ 
    		$dateTweet=new \DateTime($tweet->created_at);
    		if ($dateTweet->getTimestamp()>$start->getTimestamp()) $tweets[]=$tweet;
    	}
    	    	
		return $this->render('ProgramBundle:Program:show_ecoute.html.twig', array(
		'somethingNow' => $somethingNow,
		'currentProgram'=>$currentProgram,
		'program' => $entities,
		'now' => $day,
		'nowSlide' => $nowSlide,
		'dateStop' =>	$stop,
		'start'=> $start,
		'json' => $tweets	));
    }

}
