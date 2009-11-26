package EnsEMBL::Web::Component::UserData::ConsequenceTool;

use strict;
use warnings;
no warnings "uninitialized";
use base qw(EnsEMBL::Web::Component::UserData);
use CGI qw(escapeHTML);

sub _init {
  my $self = shift;
  $self->cacheable( 0 );
  $self->ajaxable(  1 );
}

sub caption {
  return;
}

sub content {
  my $self = shift;
  my $object = $self->object;
  my $html = '<h2>Consequence Calculator Results:</h2>';
  my $referer =  $object->param('_referer');
  $html .= qq(<br /><a href="$referer">Back to previous view</a><br />);


  my @files = ($object->param('convert_file'));

  foreach my $file_name (@files) {
    my ($file, $name) = split(':', $file_name);  
    my $table = $object->calculate_consequence_data($file);
    $html .= $table->render;
  }

  return $html;
}
1;
