//MooTools More, <http://mootools.net/more>. Copyright (c) 2006-2009 Aaron Newton <http://clientcide.com/>, Valerio Proietti <http://mad4milk.net> & the MooTools team <http://mootools.net/developers>, MIT Style License.

MooTools.More={version:"1.2.3.1"};var Group=new Class({initialize:function(){this.instances=Array.flatten(arguments);this.events={};this.checker={};},addEvent:function(b,a){this.checker[b]=this.checker[b]||{};
this.events[b]=this.events[b]||[];if(this.events[b].contains(a)){return false;}else{this.events[b].push(a);}this.instances.each(function(c,d){c.addEvent(b,this.check.bind(this,[b,c,d]));
},this);return this;},check:function(c,a,b){this.checker[c][b]=true;var d=this.instances.every(function(f,e){return this.checker[c][e]||false;},this);if(!d){return;
}this.checker[c]={};this.events[c].each(function(e){e.call(this,this.instances,a);},this);}});