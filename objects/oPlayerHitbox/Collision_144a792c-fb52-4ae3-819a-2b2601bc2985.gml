//Collis
if ds_list_find_index(hitobj, other) != -1
{
	exit;
}

other.flash = 7;
ds_list_add(hitobj, other);

