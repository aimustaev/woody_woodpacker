/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aimustaev <aimustaev@student.42.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/05 01:55:16 by aimustaev         #+#    #+#             */
/*   Updated: 2023/02/05 01:55:22 by aimustaev        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "woody.h"

void elf_error(char *err)
{
    printf("%s", err);
    exit(1);
}