package Bio::EnsEMBL::GlyphSet::marker;
use strict;
use vars qw(@ISA);
use lib "..";
use Bio::EnsEMBL::GlyphSet;
@ISA = qw(Bio::EnsEMBL::GlyphSet);
use Bio::EnsEMBL::Glyph::Rect;

sub _init {
    my ($this, $VirtualContig, $Config) = @_;

    for(my $i = 0; $i<1000; $i+=100) {
	my $glyph = new Bio::EnsEMBL::Glyph::Rect({
	    'x'      => $i,
	    'y'      => 0,
	    'width'  => 20,
	    'height' => 8,
	    'id'     => qq(fpc$i),
	    #########
	    # evil:
	    #
	    'colour'    => $Config->get('contigviewtop', 'marker', 'col'),
	});

	$this->push($glyph);
    }
}
1;
