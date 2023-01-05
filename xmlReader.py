from xml.dom import minidom

def LeerXmlUser():
    doc = minidom.parse("prueba.xml")
    nombre = doc.getElementsByTagName("username")[0]
    return nombre.firstChild.data


def LeerXmlPass():
    doc = minidom.parse("prueba.xml")
    nombre = doc.getElementsByTagName("password")[0]
    return nombre.firstChild.data

#print(LeerXmlPass())
def leerXmlCedulaSolicitante():
    doc=minidom.parse("ArchivosXML/solicitante.xml")
    nombre=doc.getElementsByTagName("cedula")[0]
    return nombre.firstChild.data