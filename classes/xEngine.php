<?php

Class xEngine
{
	function CreateXMLFromArray($xDoc, $xNode, $ar)
	{
	    foreach($ar as $key=>$val)
	    {
	        if(!is_string($key) || strlen($key)<=0 || strpos($key, "~") !== false)
	        {
	            $key = "item";
	        }

			////////////
			if($key=='__attr'){
				foreach($val as $k=>$v){
			      $xNode->setAttribute($v['__k'],$v['__v']);
				}
				continue;
			}
			//////////

			$tmpKey=explode('.',$key);
	        $xElement = $xDoc->createElement($key);
	        if(is_array($val))
	        {
	            xEngine::CreateXMLFromArray($xDoc, $xElement, $val);
	        }
	        else if(count($tmpKey)>1 and $tmpKey[0]=='CDATA')
	        {
	            $xElement = $xDoc->createElement($tmpKey[1]);
				$text = $xDoc->createCDATASection($val);
	            $xElement->appendChild($text);

	        }
	        else
	        {
	            $xElement->appendChild($xDoc->createTextNode($val));
	        }
	        $xNode->appendChild($xElement);
	    }
	    return $xNode;
	}

	function XSLTEngine($arResult,$xsl,$prnt=false)
	{
	    $xDoc = new DOMDocument('1.0','utf-8');
	    $xRoot = $xDoc->createElement('site');
	    xEngine::CreateXMLFromArray($xDoc, $xRoot, $arResult);
	    $xDoc->appendChild($xRoot);
	    $xDoc->formatOutput = true;
	    if($prnt)
	    {
	        print $xDoc->saveXML();
	    }
	    else
	    {
			$xDoc->saveXML();
	    }

	    $xXsl = new DOMDocument();
	    $xXsl->load($xsl);

	    $xProc = new XSLTProcessor;
	    $xProc->importStyleSheet($xXsl);


	    echo $xProc->transformToXML($xDoc);
	}
}
