<?php

namespace RadioSolution\StaticContentBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use RadioSolution\StaticContentBundle\Entity\StaticContent;

/**
 * StaticContent controller.
 *
 */
class DailymediaStaticContentController extends Controller
{
    /**
     * Finds and displays a StaticContent entity.
     *
     */
    public function showAction()
    {
        $em = $this->getDoctrine()->getEntityManager();

        $query = $em->createQuery('SELECT dm FROM StaticContentBundle:DailymediaStaticContent dm ORDER BY dm.id ASC')->setMaxResults(1);
        $entity = $query->getResult();
        if (!$entity) {
            throw $this->createNotFoundException('Unable to find StaticContent entity.');
        }
        

        return $this->render('StaticContentBundle:DailymediaStaticContent:show.html.twig', array(
            'entity'      => $entity,
        ));
    }
}
