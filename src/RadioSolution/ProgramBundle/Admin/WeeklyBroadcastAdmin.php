<?php 
namespace RadioSolution\ProgramBundle\Admin;
 
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
 
class WeeklyBroadcastAdmin extends Admin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
		//->add('day','sonata_type_collection')
    	->add('day','integer',array('label'=>'day (1=lundi,2=mardi,3=mercredi,4=jeudi,5=vendredi,6=samedi,7=dimanche)'))
		->add('hour')
		->add('duration')
    ;
  }
 
  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
      ->add('id')
    ;
  }
 
  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
      ->addIdentifier('id')
    ;
  }
 
  public function validate(ErrorElement $errorElement, $object)
  {
  }
}