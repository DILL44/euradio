<?php 
namespace RadioSolution\PodcastBundle\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

class GeneratePodcastCommand extends ContainerAwareCommand
{
    protected function configure()
    {
        $this
            ->setName('pocast:genrate')
            ->setDescription('generate podcast in ftp folder')
            ->addArgument(
                'folder',
                InputArgument::OPTIONAL,
                'give folder with mp3'
            )
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
    	$directory=dir($input->getArgument('folder'));
    	if ($directory){
	    	while (false !== ($entry = $directory->read())) {
	    		if($entry!='.' && $entry!='..'){
	    			$filename="$directory->path$entry";
	    			$size=filesize($filename);
	    			$output->writeln("$filename: $size");
	    			//$file=fopen($filename, 'w+',true);
	    			$media = new \Application\Sonata\MediaBundle\Entity\Media;
	    			$media->setBinaryContent($filename);
	    	
	    			$output->writeln("create media $filename OK");
	    			$this->getContainer()->get('sonata.media.manager.media')->save($media,'default','sonata.media.provider.podcast');
	    			//fclose($file);
	    			$output->writeln("save media OK");
	    		}
	    	}
	    	$output->writeln('finish');
    	}else{
    		$output->writeln("folder doesn't exist");
    	}
    }
}