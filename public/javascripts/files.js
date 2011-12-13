//upload more files
var xmlHttp
	var fileId = 1;
	function addElement(parentId, elementTag, elementId, html)
	{
		var p = document.getElementById(parentId);
		var newElement = document.createElement(elementTag);
		newElement.setAttribute('id', elementId);
		newElement.innerHTML = html;
		//alert(html);
		p.appendChild(newElement);
	}

	function removeElement(elementId)
	{
		var element = document.getElementById(elementId);
		element.parentNode.removeChild(element);
                fileId--;
		if(fileId<10)
		{
			document.getElementById('uploadlink').style.display = '';
		}
	}

	function addFile()
	{
		fileId++;
		var html="";
		html = html+"<input type=\"file\" name=\"itemFile["+fileId+"]\" size=\"40\"/>" +
	    '&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:removeElement(\'itemFile[' + fileId + ']\'); return false;"><span class="removebro">Remove</span></a>';

		addElement('ItemFiles', 'p', 'itemFile[' + fileId+']', html);
                if(fileId==10)
		document.getElementById('uploadlink').style.display = 'none';
		}
