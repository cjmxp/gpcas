/**
 * This license does NOT supersede the original license of GPC.  Please see:
 * http://www.cs.man.ac.uk/~toby/alan/software/#Licensing
 *
 * This license does NOT supersede the original license of SEISW GPC Java port.  Please see:
 * http://www.seisw.com/GPCJ/GpcjLicenseAgreement.txt
 *
 * Copyright (c) 2009, Jakub Kaniewski, jakub.kaniewsky@gmail.com
 * BMnet software http://www.bmnet.pl/
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *   - Neither the name of the BMnet software nor the
 *     names of its contributors may be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY JAKUB KANIEWSKI, BMNET ''AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL JAKUB KANIEWSKI, BMNET BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package
{
	import flash.geom.*;
	
	import mx.containers.Canvas;
	
	import pl.bmnet.gpcas.geometry.Poly;
	
	public class PolyCanvas extends Canvas
	{
		public var polygons : Array = [];
		
		
		
		public function clear():void{
			graphics.clear();
		}
		
		public function drawPoly(poly:Poly, scale:Number = 1, ox:int=0, oy:int=0):void{
			graphics.lineStyle(2, 0xFF0000);
			graphics.beginFill(0xCC92A8);
			for (var i:int=0; i<poly.getNumPoints();i++){
				if (i==0){
					graphics.moveTo(poly.getX(i)*scale+ox,poly.getY(i)*scale+oy);
				} else {
					graphics.lineTo(poly.getX(i)*scale+ox,poly.getY(i)*scale+oy);
				}
			}
			for (i=0; i<poly.getNumPoints();i++){
				graphics.drawCircle(poly.getX(i)*scale+ox,poly.getY(i)*scale+oy,3);
			}
			graphics.endFill();
		}
		
		
		
		
		public function drawPoint(x:int, y:int):void{
			graphics.lineStyle(2, 0xA5CC81);
			graphics.drawCircle(x,y,4);
		}
		
		public function drawLine(p1:Array,p2:Array):void{
			
			graphics.lineStyle(1, 0x0000CC);
			graphics.moveTo(p1[0],p1[1]);
			graphics.lineTo(p2[0],p2[1]);
		}
		
		public function drawPolyline(polyline : Array /* of Point */):void{
			
			graphics.lineStyle(2, 0x0000CC);
			var point : Point = polyline[0] as Point;
			graphics.moveTo(point.x,point.y);
			for (var i : int = 1; i<polyline.length; i++){
				point = polyline[i];
				graphics.lineTo(point.x,point.y);
			}
		}
		
		public function PolyCanvas()
		{
			super();
		}
		
		
		
	}
}

