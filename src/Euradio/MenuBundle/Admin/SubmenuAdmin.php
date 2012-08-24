<?php 
//src/Euradio/MenuBundle/Admin/SubmenuAdmin.php
namespace Euradio\MenuBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Show\ShowMapper;

use Knp\Menu\ItemInterface as MenuItemInterface;

use  Euradio\MenuBundle\Entity\Link;

class SubmenuAdmin extends Admin
{
	/**
	 * @param \Sonata\AdminBundle\Show\ShowMapper $showMapper
	 *
	 * @return void
	 */
	protected function configureShowField(ShowMapper $showMapper)
	{
		$showMapper
			->add('enabled')
			->add('title')
			->add('links')
			->add('submenu')
		;
	}
	
	/**
	 * @param \Sonata\AdminBundle\Show\ShowMapper $showMapper
	 *
	 * @return void
	 */
	protected function configureFormFields(FormMapper $formMapper)
	{
		$formMapper
			->with('General')
				->add('enabled', null, array('required' => false))
				->add('title')
			->end()
			->with('Links')
				->add('links', 'sonata_type_model', array('expanded' => true))
			->end()
		;
	}
	
	/**
	 * @param \Sonata\AdminBundle\Datagrid\ListMapper $listMapper
	 *
	 * @return void
	 */
	protected function configureListFields(ListMapper $listMapper)
	{
		$listMapper
		->addIdentifier('title')
		->add('enabled')
		->add('links')
		->add('_action', 'actions', array(
				'actions' => array(
						'view' => array(),
						'edit' => array(),
						'delete' => array(),
				)
		));
	}
	
	/**
	 * @param \Sonata\AdminBundle\Datagrid\DatagridMapper $datagridMapper
	 *
	 * @return void
	 */
	protected function configureDatagridFilters(DatagridMapper $datagridMapper)
	{
		$datagridMapper
		->add('title')
		->add('enabled')
		->add('links', null, array('field_options' => array('expanded' => true, 'multiple' => true)))
		;
	}
}