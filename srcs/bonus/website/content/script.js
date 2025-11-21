document.addEventListener('DOMContentLoaded', function() {
    // Animate skill bars on scroll
    const skillBars = document.querySelectorAll('.skill-bar .fill');
    
    const animateSkills = () => {
        skillBars.forEach(bar => {
            const rect = bar.getBoundingClientRect();
            if (rect.top < window.innerHeight) {
                bar.style.width = bar.style.width || '0%';
            }
        });
    };

    window.addEventListener('scroll', animateSkills);
    animateSkills(); // Initial check

    // Project cards animation
    const projectCards = document.querySelectorAll('.project-card');
    projectCards.forEach((card, index) => {
        card.style.animationDelay = `${index * 0.1}s`;
    });

    // Console easter egg
    console.log('%c👋 Hi there!', 'font-size: 24px; color: #667eea; font-weight: bold;');
    console.log('%cInterested in the code? Check out my GitHub!', 'font-size: 14px; color: #764ba2;');
    console.log('%chttps://github.com/hi0ki', 'font-size: 14px; color: #667eea;');
});