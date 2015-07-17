function localStoragegetItem(i) {
	if(localStorage.getItem(i)!=="hi") {
	alert("No hi");
	return	true;
	}else {
	alert("hi");
	return false;
	}
}
