//
//  Script.swift
//  Instagram
//
//  Created by Alexey Papin on 29.07.2024.
//

public enum Script {
	static let reelsButtonAHref = "/reels/"
	
	case replaceReelsButton
	
	var text: String {
		switch self {
		case .replaceReelsButton:
        """
        button.querySelector('a[href="\(Script.reelsButtonAHref)"]').outerHTML = button.querySelector('a[href="\(Script.reelsButtonAHref)"]').innerHTML;
        
        button.querySelector('svg').outerHTML = `
        <svg class="no-reel-logo" role="img" width="24" height="24" viewBox="0 0 560 460" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g id="Frame 1">
        <circle id="eye-left" cx="105" cy="301" r="77.5" stroke="currentColor" stroke-width="45" />
        <path id="eye-right"
        d="M532.5 267C532.5 341.432 482.942 394.5 430 394.5C377.058 394.5 327.5 341.432 327.5 267C327.5 192.568 377.058 139.5 430 139.5C482.942 139.5 532.5 192.568 532.5 267Z"
        stroke="currentColor" stroke-width="45" />
        <line id="mouth" x1="227.5" y1="408.5" x2="282.5" y2="408.5" stroke="currentColor" stroke-width="45"
        stroke-linecap="round" />
        <g id="eyebrow">
        <path id="eyebrow-right" d="M429.947 28L506.551 92.2788" stroke="currentColor" stroke-width="45"
        stroke-linecap="round" />
        <path id="eyebrow-left" d="M353 92.4948L429.604 28.216" stroke="currentColor" stroke-width="45"
        stroke-linecap="round" />
        </g>
        </g>
        </svg>
        `;
        
        const eyebrow = button.querySelector('#eyebrow');
        button.querySelector('.no-reel-logo').addEventListener('click', function() {
        eyebrow.classList.add('no-reel-logo-animation');
        
        eyebrow.addEventListener('animationend', () => {
        eyebrow.classList.remove('no-reel-logo-animation');
        });
        });
        """
		}
	}
	
	var javaScript: String {
		"(function() { \(text) })();"
	}
}
