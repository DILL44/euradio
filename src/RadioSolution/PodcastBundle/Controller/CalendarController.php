<?php

namespace RadioSolution\PodcastBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use RadioSolution\StaticContentBundle\Entity\StaticContent;

/**
 * StaticContent controller.
 *
 */
class CalendarController extends Controller
{
	/**
	 * Finds and displays a StaticContent entity.
	 *
	 */
	public function showCalendarAction()
	{
		$start=new \Datetime('now');
		$domain = $this->get('request')->server->get('HTTP_HOST');
		return $this->render('PodcastBundle:Podcast:calendar.html.twig', array(
				'now'	=> $start,
				'domain'=>$domain,
		));
	}
}
