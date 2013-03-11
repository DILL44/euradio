<?php

namespace RadioSolution\ProgramBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use RadioSolution\ProgramBundle\Entity\Emission;
use Ps\PdfBundle\Annotation\Pdf;

/**
 * Emission controller.
 *
 * @Route("/")
 */
class ProgramController extends Controller
{
    /**
     * Lists all Emission entities.
     *
     * @Route("/", name="")
     * @Template()
     */
    public function indexAction()
    {
    	$format = $this->get('request')->get('_format');
    	
    	$timestampDay=60*60*24;    	
    	$timestampWeek = $timestampDay*7;
    	
    	
    	$start=new \Datetime('now');    	
    	$weekNumber = date("W");
    	
    	
    	if($start->format('w')!=0){    	
	    	while($start->format('w')!=0){	    	
	    		$start->setTimestamp($start->getTimestamp()-$timestampDay);	    		
	    	}
	    	
	    	$start->setTime('00','00');	    	
	    	$stop=new \Datetime('now');	    	
	    	while($stop->format('w')!=0){	    	
	    		$stop->setTimestamp($stop->getTimestamp()+$timestampDay);	    		
	    	}	    	
	    	$stop->setTime('00','00');	    	
    	}else{
    		$start->setTime('00','00');
    		$stop=new \Datetime('now');
    		$stop->setTimestamp($stop->getTimestamp()+7*$timestampDay);
    		$stop->setTime('00','00');
    	}
    	if (isset($_GET['week'])) {
    		$start->setISODate($start->format('Y'), $_GET['week'],1);
    		$stop->setISODate($stop->format('Y'), $_GET['week'],8);
    		$weekNumber=$_GET['week'];
    	}
    	$em = $this->getDoctrine()->getEntityManager();
    	$query = $em->createQuery("SELECT p FROM ProgramBundle:Program p WHERE p.time_stop<:stop AND p.time_start>:start AND p.time_start<p.time_stop  ORDER BY p.time_start ASC")
    	->setParameters(array('start'=>$start,'stop'=>$stop));
    	$entities=$query->getResult();
		
    	

    	 
    	
        return  $this->render(sprintf('ProgramBundle:Program:index.%s.twig', $format),array(
        	'entities' => $entities,
        	'weekNumber' => $weekNumber,
        	'start'=>$start,
        	'stop'=>$stop
        	));       
    }

    public function onairAction()
    {
    	$onairs = array();
    	$onairs[] = "";
    	
    	
    	$file = fopen('http://www.euradionantes.eu/uploads/onair/now_playing.txt', 'r');
    	$onairs[] = fgets($file);
    	
    	return $this->render('ProgramBundle:Program:show_onair.html.twig', array('onairs' => $onairs));
    	
    
    }
    
    
    
}
