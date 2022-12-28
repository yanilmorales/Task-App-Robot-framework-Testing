from xml.dom import minidom
doc = minidom.parse("prueba.xml")
nombre = doc.getElementsByTagName("descripcion")[0]
print(nombre.firstChild.data)
