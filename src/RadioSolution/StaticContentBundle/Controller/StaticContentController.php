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
    	//\$page->setTitle('test');
        $em = $this->getDoctrine()->getEntityManager();

        $entity = $em->getRepository('StaticContentBundle:StaticContent')->findOneBySlug($slug);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find StaticContent entity.');
        }

        $seoPage = $this->container->get('sonata.seo.page');
        $seoPage->setTitle($entity->getName().' - Eur@dionantes')
       			 ->addMeta('name', 'description', html_entity_decode($entity->getIntroduction()));
        
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
    											
    	$entities = $em->createQuery('SELECT c FROM StaticContentBundle:StaticContent c WHERE ('.$condition.') ORDER BY c.order_content DESC, c.date_add ASC')
    	->setMaxResults(20)
    	->getResult();
    	
    	$seoPage = $this->container->get('sonata.seo.page');
    	$seoPage->setTitle($entity->getName().' - Eur@dionantes');
    						
    	
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
    	$entities = $em->createQuery('SELECT c FROM StaticContentBundle:StaticContent c WHERE c.categoryStaticContent=:idCategory ORDER BY c.order_content DESC, c.date_add ASC')->setParameter('idCategory', $entity->getId())
    	->getResult();
    
    	$seoPage = $this->container->get('sonata.seo.page');
    	$seoPage->setTitle($entity->getName().' - Eur@dionantes');    	
    	
    	return $this->render('StaticContentBundle:CategoryStaticContent:showCategorie.html.twig', array(
    			'entity'      => $entity,
    			'entities'      => $entities,
    	));
    }
}
