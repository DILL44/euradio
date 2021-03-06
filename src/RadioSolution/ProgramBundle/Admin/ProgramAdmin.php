<?php 
namespace RadioSolution\ProgramBundle\Admin;
 
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
 
class ProgramAdmin extends Admin
{
	
	protected $datagridValues = array(
			'_sort_order' => 'DESC', // sort direction
			'_sort_by' => 'time_start' // field name
	);	
	
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
      ->add('time_start','datetime', array('data_timezone' => "GMT",'user_timezone' => "GMT", 'label' => 'Debut' ))
      ->add('time_stop','datetime', array('data_timezone' => "GMT",'user_timezone' => "GMT", 'label' => 'Fin' ))
      ->with('podcast')
      ->add('podcast', 'sonata_type_model',array('required' => false), array('edit' => 'list'))
      ->add('emission', 'sonata_type_model',array('required' =>true), array('edit' => 'list'))
      ->end()
    ;
  }
 
  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
      ->add('id')
      ->add('emission')
      ->add('time_start')
    ;
  }
 
  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
      ->addIdentifier('id')
      ->add('emission')
      ->add('time_start')
      ->add('time_stop')
      ->add('collision')
      ->add('_action', 'actions', array(
      		'actions' => array(
      				'view' => array(),
      				'edit' => array(),
      		)
      	))
    ;
  }
 
  public function validate(ErrorElement $errorElement, $object)
  {
    	if ($object->getPodcast()){
    		$object->getPodcast()->setRealTimeStart($object->getTimeStart());
    		$object->getPodcast()->getPost()->setCreatedAt($object->getTimeStart());
    	}
  }
}