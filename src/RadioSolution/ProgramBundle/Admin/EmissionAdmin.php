<?php 
namespace RadioSolution\ProgramBundle\Admin;
 
use Symfony\Component\Form\Extension\Core\DataTransformer\DateTimeToTimestampTransformer;
use RadioSolution\ProgramBundle\Entity\Program;
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use RadioSolution\ProgramBundle\Entity\ExceptionalBroadcast;
use RadioSolution\ProgramBundle\Entity\WeeklyBroadcast;


class EmissionAdmin extends Admin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
      ->add('name')
      ->add('description')
      ->add('theme', 'sonata_type_model',array('required' => false))
      ->add('group', 'sonata_type_model',array('required' => false))
      ->add('media', 'sonata_type_model',array('required' => false))
    ->with('Diffusions')
    ->add('diffusion_start')
    ->add('difusion_stop')
    ->add('ExceptionalBroadcast', 'sonata_type_collection', array('required' => false, 'by_reference' =>true), array(
                'edit' => 'inline',
    			'inline' => 'table',
            ))
    ->add('WeeklyBroadcast', 'sonata_type_collection', array('required' => false, 'by_reference' =>true), array(
                'edit' => 'inline',
                'inline' => 'table',
            ))
    ->end();
    ;
  }
 
  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
      ->add('name')
    ;
  }
 
  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
      ->addIdentifier('name')
    ;
  }
 
  public function validate(ErrorElement $errorElement, $object)
  {
  	$exceptional=$object->getExceptionalBroadcast();
  	$q=$this->createQuery()->delete('ProgramBundle:Program','p')  	
  	->where('p.emission = :id_emmission')
  	->setParameter('id_emmission',(String)$object->getId());
  	$q->getQuery()->execute();
  	
  
  	foreach ($exceptional as $value){
  		$value->setEmission($object);
  		$convert=new DateTimeToTimestampTransformer();  		
  		$program=new Program();
  		$program->setTimeStart($value->getTimeStart());
  		(int)$timeValue=$convert->transform($value->getTimeStart())+$convert->transform($value->getDuration());
  		$program->setTimeStop(new \DateTime(date('c',$timeValue)));
  		$program->setEmission($object);
  		$this->prePersist($program);
  		$this->getModelManager()->create($program);
  		$this->postPersist($program);
  		$this->createObjectSecurity($program);
  	}
  	
  	$weekly=$object->getWeeklyBroadcast();
  	
  	foreach ($weekly as $value){
  		$value->setEmission($object);
  	}
  	
    $errorElement
      ->with('name')
      ->assertMaxLength(array('limit' => 32))
      ->end()
    ;
  }
  
}
