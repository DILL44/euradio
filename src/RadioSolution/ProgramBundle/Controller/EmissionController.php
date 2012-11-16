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
    public function indexAction()
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entities = $em->getRepository('ProgramBundle:Emission')->findAll();

        return array('entities' => $entities);
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

        $entity = $em->getRepository('ProgramBundle:Emission')->findByName($name);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Emission entity.');
        }

        return array(
            'entity'      => $entity,
        );
    }

}
