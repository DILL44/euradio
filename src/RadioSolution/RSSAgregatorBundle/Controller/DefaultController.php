<?php

namespace RadioSolution\RSSAgregatorBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;


class DefaultController extends Controller
{
    
    public function indexAction($limit = 7)
    {
    	
    	
    	$em = $this->getDoctrine()->getEntityManager();
    	$query = $em->createQuery("SELECT p FROM RSSAgregatorBundle:RSSfile p WHERE p.enable=true");
    	$query->setMaxResults($limit);
    	$entities=$query->getResult();

    	//$allFeeds = array('title' => 'Titre', 'desc' => 'Desc', 'link' => 'Lien','date' => 'Date',);
    	$allFeeds = array();
    	
    
    	foreach($entities as $entity){
    		
    		if($entity->getUrl()){
    			
			   $ch = curl_init();
			   curl_setopt($ch, CURLOPT_URL, $entity->getUrl());
			   curl_setopt($ch, CURLOPT_HEADER, 0);
			   curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			   curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr-FR; rv:1.7.5) Gecko/20041107 Firefox/1.0');
			   $content = curl_exec($ch);
			   curl_close($ch);

			   $content = mb_convert_encoding($content, 'utf-8', mb_detect_encoding($content));
			   
    			$doc = new \DOMDocument();
    			$doc->loadXML($content);
    			//$doc->formatOutput = true;
    			
    			$i = 0;
    			
    			
    			foreach ($doc->getElementsByTagName('item') as $node) {
    				
    				if(isset($node->getElementsByTagName('pubDate')->item(0)->nodeValue)){
    				
	    				$allFeeds[] = array (
	    						'name' => $entity->getName(),
	    						'title' => $node->getElementsByTagName('title')->item(0)->nodeValue,
	    						'desc' => $node->getElementsByTagName('description')->item(0)->nodeValue,
	    						'link' => $node->getElementsByTagName('link')->item(0)->nodeValue,
	    						'date' => strtotime($node->getElementsByTagName('pubDate')->item(0)->nodeValue)
	    				);
	
	    				
	    				$i++;
	    				
	    				if($i>($limit-1)){
	    					break;
	    				}
	    				
    				}
    				
    			}
    			
    		}
    		
    	}
    	
    	$name = array();
    	$title = array();
    	$desc = array();
    	$link = array();
    	$date = array();
    	
    	foreach($allFeeds as $feed){
    		$name[] = $feed['name'];
    		$title[] = $feed['title'];
    		$desc[] = $feed['desc'];
    		$link[] = $feed['link'];
    		$date[] = $feed['date'];
			

    	}
    	
    	array_multisort($date, SORT_DESC, $name, $title, $desc, $link);
    	
    	$allFeeds = array();
    	
    	for($i=0; $i<count($date); $i++){
    		
    		$allFeeds[]= array('date' => date('d/m H:i', $date[$i]), 'name'=> $name[$i], 'title' => $title[$i], 'desc' => $desc[$i], 'link' => $link[$i]);
    		
    		if($i >= $limit){
    			
    			break;
    			
    		}
    		
    	}
    	
        return $this->render('RSSAgregatorBundle:Default:index.html.twig', array('allFeeds' => $allFeeds));
    }
    
}
