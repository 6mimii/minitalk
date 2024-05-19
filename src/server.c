/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mdoudi-b <mdoudi-b@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/14 20:01:42 by mdoudi-b          #+#    #+#             */
/*   Updated: 2024/05/19 13:53:34 by mdoudi-b         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../minitalk.h"

void	handle_signal(int signal)
{
	static unsigned char	g_bit_count;
	static int				g_character;

	if (signal == SIGUSR1)
		g_character |= (0 << (7 - g_bit_count));
	else if (signal == SIGUSR2)
		g_character |= (1 << (7 - g_bit_count));
	g_bit_count++;
	if (g_bit_count == 8)
	{
		write (1, &g_character, 1);
		g_bit_count = 0;
		g_character = 0;
	}
}

int	main(void)
{
	ft_printf("%d\n", getpid());
	signal(SIGUSR1, handle_signal);
	signal(SIGUSR2, handle_signal);
	while (1)
		pause();
	return (0);
}
