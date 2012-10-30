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
    public function showAction($name)
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entity = $em->getRepository('StaticContentBundle:StaticContent')->findOneByName($name);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find StaticContent entity.');
        }

        return $this->render('StaticContentBundle:StaticContent:show.html.twig', array(
            'entity'      => $entity,
        ));
    }

}
