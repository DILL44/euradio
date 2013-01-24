<?php

namespace RadioSolution\StaticContentBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use RadioSolution\StaticContentBundle\Entity\StaticContent;

/**
 * StaticContent controller.
 *
 */
class StaticContentController extends Controller
{
    /**
     * Finds and displays a StaticContent entity.
     *
     */
    public function showAction($slug)
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entity = $em->getRepository('StaticContentBundle:StaticContent')->findOneBySlug($slug);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find StaticContent entity.');
        }

        return $this->render('StaticContentBundle:StaticContent:show.html.twig', array(
            'entity'      => $entity,
        ));
    }

    public function  showListAction($slug)
    {
    	$em = $this->getDoctrine()->getEntityManager();
    
    	$entity = $em->getRepository('StaticContentBundle:CategoryStaticContent')->findOneBySlug($slug);
    	if (!$entity) {
    		throw $this->createNotFoundException('Unable to find StaticContent entity.');
    	}
    	

    	$categories=$em->getRepository('StaticContentBundle:CategoryStaticContent')->findByParent($entity->getId());
    	
    	$condition='';
    	$i = 0;
    	foreach ($categories as $subcategorie){
    		if($i != 0){
    			$condition.=' OR ';
    		}
    		$condition.='c.categoryStaticContent='.$subcategorie->getId();
    		$i++;
    	}
    											
    	$entities = $em->createQuery('SELECT c FROM StaticContentBundle:StaticContent c WHERE ('.$condition.') ORDER BY c.order_content ASC')
    	->setMaxResults(20)
    	->getResult();

    	
    	return $this->render('StaticContentBundle:CategoryStaticContent:showList.html.twig', array(
    			'entity'      => $entity,
    			'entities'      => $entities,
    	));
    	
    	
    }
    
    public function showCategorieAction($slug)
    {
    	$em = $this->getDoctrine()->getEntityManager();
    
    	$entity = $em->getRepository('StaticContentBundle:CategoryStaticContent')->findOneBySlug($slug);
    	if (!$entity) {
    		throw $this->createNotFoundException('Unable to find StaticContent entity.');
    	}
    	$entities = $em->createQuery('SELECT c FROM StaticContentBundle:StaticContent c WHERE c.categoryStaticContent=:idCategory ORDER BY c.order_content ASC')->setParameter('idCategory', $entity->getId())
    	->getResult();
    
    	return $this->render('StaticContentBundle:CategoryStaticContent:showCategorie.html.twig', array(
    			'entity'      => $entity,
    			'entities'      => $entities,
    	));
    }
}
