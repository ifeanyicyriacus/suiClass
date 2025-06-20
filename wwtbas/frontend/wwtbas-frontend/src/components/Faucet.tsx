import { getFaucetHost, requestSuiFromFaucetV2 } from '@mysten/sui/faucet';
import { useEffect } from 'react';

const Faucet = () => {
    useEffect(() => {
        async function fetchFaucet() {
            await requestSuiFromFaucetV2({
                host: getFaucetHost('localnet'),
                recipient: '0x44f3f10c9b90982b572bdc52aeb58558dd84e420b4980a4bdabdf11d3bec2126',
            }).catch((error) => {
                console.error('Error requesting SUI from faucet:', error);
            }).then((response) => {
                console.log('Faucet response:', response);
                alert('Faucet initialized successfully!');
            });
        }
        fetchFaucet();
    }, []);

    const handleFaucetClick = async () => {
        try {
            const response = await requestSuiFromFaucetV2({
                host: getFaucetHost('localnet'),
                recipient: '0x44f3f10c9b90982b572bdc52aeb58558dd84e420b4980a4bdabdf11d3bec2126',
            });
            console.log('Faucet response:', response);
            alert('Tokens claimed successfully!');
        } catch (error) {
            console.error('Error requesting SUI from faucet:', error);
            alert('Failed to claim tokens. Please try again later.');
        }
    };

return (
    <div className="faucet">
        <h2>Faucet</h2>
        <p>Get some test tokens to play around with!</p>
        <button onClick={() => 
            // alert('Faucet functionality coming soon!')
            handleFaucetClick()
            }>
            Claim Tokens
        </button>
    </div>
);
}

export default Faucet;
